# System Imports
vars = import_module("github.com/logos-co/wakurtosis/src/system_variables.star")

# Module Imports
files = import_module(vars.FILE_HELPERS_MODULE)


def send_json_rpc(plan, service_name, port_id, method, params, extract={}):
    recipe = PostHttpRequestRecipe(
        service_name=service_name,
        port_id=port_id,
        endpoint="",
        content_type="application/json",
        body='{ "jsonrpc": "2.0", "method": "' + method + '", "params": [' + params + '], "id": 1}',
        extract=extract
    )

    response = plan.wait(recipe=recipe,
                    field="code",
                    assertion="==",
                    target_value=200)

    return response


def get_wakunode_peer_id(plan, service_name, port_id):
    extract = {"peer_id": '.result.listenAddresses | .[0] | split("/") | .[-1]'}

    response = send_json_rpc(plan, service_name, port_id,
                             vars.GET_WAKU_INFO_METHOD, "", extract)

    plan.assert(value=response["code"], assertion="==", target_value = 200)

    return response["extract.peer_id"]


# todo better name for this function
def create_waku_id(node_id, node_information):
    ip = node_information["ip_address"]
    port = node_information["ports"][vars.WAKU_LIBP2P_PORT_ID + "_" + node_id][0]
    waku_node_id = node_information["peer_id"]

    return '"/ip4/' + str(ip) + '/tcp/' + str(port) + '/p2p/' + waku_node_id + '"'


def _merge_peer_ids(peer_ids):
    return "[" + ",".join(peer_ids) + "]"


def connect_wakunode_to_peers(plan, service_name, node_id, port_id, peer_ids):
    method = vars.CONNECT_TO_PEER_METHOD
    params = _merge_peer_ids(peer_ids)
    port_id = port_id + "_" + node_id

    response = send_json_rpc(plan, service_name, port_id, method, params)

    plan.assert(value=response["code"], assertion="==", target_value = 200)

    plan.print(response)


def post_waku_v2_relay_v1_message_test(plan, service_name, topic):
    waku_message = '{"payload": "0x1a2b3c4d5e6f", "timestamp": 1626813243}'
    params = '"' + topic + '"' + ", " + waku_message

    response = send_json_rpc(plan, service_name, vars.RPC_PORT_ID,
                             vars.POST_RELAY_MESSAGE_METHOD, params)

    plan.assert(value=response["code"], assertion="==", target_value = 200)


def make_service_wait(plan, service_name, time):
    exec_recipe = struct(
        service_name=service_name,
        command=["sleep", time]
    )
    plan.exec(exec_recipe)


def get_waku_peers(plan, waku_service_name):
    extract = {"peers": '.result | length'}

    response = send_json_rpc(plan, waku_service_name, vars.RPC_PORT_ID,
                             vars.GET_PEERS_METHOD, "", extract)

    plan.assert(value=response["code"], assertion="==", target_value=200)

    return response["extract.peers"]


def interconnect_waku_nodes(plan, topology_information, interconnection_batch):
    # Interconnect them
    for node_id in topology_information["nodes"].keys():
        peers = topology_information["nodes"][node_id]["static_nodes"]

        for i in range(0, len(peers), interconnection_batch):
            x = i
            peer_ids = [create_waku_id(peer, topology_information["nodes"][peer])
                        for peer in peers[x:x + interconnection_batch]]

            connect_wakunode_to_peers(plan, topology_information["nodes"][node_id]["container_id"],
                                      node_id, vars.RPC_PORT_ID, peer_ids)


