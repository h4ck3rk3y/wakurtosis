# Waku Configuration
NWAKU_IMAGE = "statusteam/nim-waku:nwaku-trace"
GOWAKU_IMAGE = "gowaku"

NODE_IMAGES_FROM_GENNET = ["go-waku", "nim-waku"]
RPC_PORT_ID = "rpc"
NODE_CONFIG_FILE_LOCATION = "github.com/logos-co/wakurtosis/config/topology_generated/"
CONTAINER_NODE_CONFIG_FILE_LOCATION = "/node/configuration_file/"
GENERAL_ENTRYPOINT = ["/bin/sh", "-c"]

# Waku Configuration
WAKU_RPC_PORT_PROTOCOL = "TCP"
WAKU_RPC_PORT_NUMBER = 8545
WAKU_LIBP2P_PORT_ID = "libp2p"
WAKU_LIBP2P_PORT_PROTOCOL = "TCP"
WAKU_LIBP2P_PORT = 60000

WAKUNODE_CONFIGURATION_FILE_EXTENSION = ".toml"
WAKUNODE_CONFIGURATION_FILE_FLAG = "--config-file="
WAKUNODE_PORT_SHIFT_FLAG = "--ports-shift="
NWAKU_ENTRYPOINT = "/usr/bin/wakunode --rpc-address=0.0.0.0 --metrics-server-address=0.0.0.0 --log-level=TRACE"
GOWAKU_ENTRYPOINT = "/usr/bin/waku --rpc-address=0.0.0.0 --metrics-server-address=0.0.0.0"

# Prometheus Configuration
PROMETHEUS_IMAGE = "prom/prometheus:latest"
PROMETHEUS_SERVICE_NAME = "prometheus"
PROMETHEUS_PORT_ID = "prometheus"
PROMETHEUS_PORT_PROTOCOL = "TCP"
PROMETHEUS_PORT_NUMBER = 8008
PROMETHEUS_CONFIGURATION_PATH = "github.com/logos-co/wakurtosis/monitoring/prometheus.yml"

CONTAINER_CONFIGURATION_LOCATION_PROMETHEUS = "/test/"
CONTAINER_CONFIGURATION_LOCATION_PROMETHEUS_2 = "/tmp/"
CONTAINER_CONFIGURATION_FILE_NAME_PROMETHEUS = "prometheus.yml"
CONTAINER_TARGETS_FILE_NAME_PROMETHEUS = "targets.json"
CONTAINER_PROMETHEUS_TCP_PORT = 9090

# Grafana Configuration
GRAFANA_IMAGE = "grafana/grafana:latest"
GRAFANA_CONFIGURATION_PATH = "github.com/logos-co/wakurtosis/monitoring/configuration/config/"
GRAFANA_CUSTOMIZATION_PATH = "github.com/logos-co/wakurtosis/monitoring/configuration/customizations/"
GRAFANA_DASHBOARD_PATH = "github.com/logos-co/wakurtosis/monitoring/configuration/dashboards/"

GRAFANA_SERVICE_NAME = "grafana"
GRAFANA_PORT_ID = "grafana_tcp"
GRAFANA_TCP_PORT = 3000

CONTAINER_CONFIGURATION_GRAFANA = "/etc/grafana/"
CONTAINER_DASHBOARDS_GRAFANA = "/var/lib/grafana/dashboards/"
CONTAINER_CUSTOMIZATION_GRAFANA = "/usr/share/grafana/"
CONTAINER_DATASOURCES_GRAFANA = "/etc/grafana/provisioning/datasources/"
CONTAINER_DATASOURCES_FILE_NAME_GRAFANA = "datasources.yaml"

# Gennet topology Keys
GENNET_NODES_KEY = "nodes"
GENNET_ALL_CONTAINERS_KEY = "containers"
GENNET_IMAGE_KEY = "image"
GENNET_CONFIG_KEY = "node_config"
GENNET_NODE_CONTAINER_KEY = "container_id"
GENNET_PEER_ID_KEY = "peer_id"
GENNET_IP_KEY = "ip_address"
TOPOLOGY_PORTS_KEY = "ports"

# WSL Configuration
WSL_IMAGE = "wsl:0.0.1"
WSL_SERVICE_NAME = "wsl"
WSL_CONFIG_PATH = "/wsl/config"
WSL_TARGETS_PATH = "/wsl/targets"
WSL_TOMLS_PATH = "/wsl/tomls"
CONTAINER_WSL_CONFIGURATION_FILE_NAME = "wsl.yml"
CONTAINER_TARGETS_FILE_NAME_WSL = "targets.json"

# Waku RPC methods
POST_RELAY_MESSAGE_METHOD = "post_waku_v2_relay_v1_message"
GET_WAKU_INFO_METHOD = "get_waku_v2_debug_v1_info"
CONNECT_TO_PEER_METHOD = "post_waku_v2_admin_v1_peers"
GET_PEERS_METHOD = "get_waku_v2_admin_v1_peers"

# Import locations
WAKU_MODULE = "github.com/logos-co/wakurtosis/src/waku.star"
NODE_BUILDERS_MODULE = "github.com/logos-co/wakurtosis/src/node_builders/node_builders.star"
WAKU_BUILDER_MODULE = "github.com/logos-co/wakurtosis/src/node_builders/waku_builder.star"
NWAKU_BUILDER_MODULE = "github.com/logos-co/wakurtosis/src/node_builders/nwaku_builder.star"
GOWAKU_BUILDER_MODULE = "github.com/logos-co/wakurtosis/src/node_builders/gowaku_builder.star"
PROMETHEUS_MODULE = "github.com/logos-co/wakurtosis/src/monitoring/prometheus.star"
GRAFANA_MODULE = "github.com/logos-co/wakurtosis/src/monitoring/grafana.star"
ARGUMENT_PARSER_MODULE = "github.com/logos-co/wakurtosis/src/arguments_parser.star"
FILE_HELPERS_MODULE = "github.com/logos-co/wakurtosis/src/file_helpers.star"
TEMPLATES_MODULE = "github.com/logos-co/wakurtosis/src/templates.star"
WSL_MODULE = "github.com/logos-co/wakurtosis/src/wsl.star"

TEST_ARGUMENTS_MODULE = "github.com/logos-co/wakurtosis/src/tests/test_arguments_parser.star"
TEST_FILES_MODULE = "github.com/logos-co/wakurtosis/src/tests/test_file_helpers.star"
TEST_NODE_BUILDERS_MODULE = "github.com/logos-co/wakurtosis/src/tests/test_node_builders.star"
TEST_WAKU_MODULE = "github.com/logos-co/wakurtosis/src/tests/test_waku_methods.star"

# Default main starlark arguments
TOPOLOGIES_LOCATION = "github.com/logos-co/wakurtosis/config/topology_generated/"
DEFAULT_TOPOLOGY_FILE = "network_data.json"
TEST_FILES_LOCATION = "github.com/logos-co/wakurtosis/config/test_files/"
DEFAULT_TOPOLOGY_FILE_DEFAULT_ARGUMENT_VALUE = "test_network_data.json"
DEFAULT_CONFIG_FILE = "github.com/logos-co/wakurtosis/config/config.json"

# Default Simulation Parameters
SIMULATION_TIME = 300
MESSAGE_RATE = 25
MIN_PACKET_SIZE = 1
MAX_PACKET_SIZE = 1024
