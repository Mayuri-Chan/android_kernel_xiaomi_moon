. ${ROOT_DIR}/${KERNEL_DIR}/build.config.common
. ${ROOT_DIR}/${KERNEL_DIR}/build.config.aarch64

DEFCONFIG="moon_gki_defconfig"
GKI_FRAGMENT_DEFCONFIG="${KERNEL_DIR}/arch/arm64/configs/moon_gki.fragment"
PRE_DEFCONFIG_CMDS="KCONFIG_CONFIG=${ROOT_DIR}/${KERNEL_DIR}/arch/arm64/configs/${DEFCONFIG} ${ROOT_DIR}/${KERNEL_DIR}/scripts/kconfig/merge_config.sh -m -r ${ROOT_DIR}/${KERNEL_DIR}/arch/arm64/configs/gki_defconfig ${ROOT_DIR}/${GKI_FRAGMENT_DEFCONFIG}"
POST_DEFCONFIG_CMDS="rm ${ROOT_DIR}/${KERNEL_DIR}/arch/arm64/configs/${DEFCONFIG}"

FILES="
arch/arm64/boot/Image.gz
"

MAKE_GOALS="${MAKE_GOALS} Image.gz dtbs"

ABI_OUT_TAG="mtk"
KMI_SYMBOL_LIST=android/abi_gki_aarch64_mtk
GKI_MODULES_LIST=android/gki_aarch64_modules
ABI_DEFINITION=android/abi_gki_aarch64.xml

EXT_MODULES="
${EXT_MODULES}
mediatek-modules/gpu
mediatek-modules/connectivity/common
mediatek-modules/connectivity/wlan/adaptor
mediatek-modules/connectivity/wlan/core/gen4m
mediatek-modules/connectivity/bt/mt66xx/wmt
"

# Wlan driver build environnement
export MODULE_NAME="wlan_drv_gen4m_6768"
export MTK_ANDROID_EMI="y"
export WIFI_IP_SET="1"
export MTK_ANDROID_WMT="y"
export WLAN_CHIP_ID="6768"
export MTK_COMBO_CHIP="CONNAC"
export CONFIG_MTK_COMBO_WIFI_HIF="axi"
export MTK_WLAN_SERVICE="yes"

# Adaptor
export ADAPTOR_MODULE_NAME="wmt_chrdev_wifi"

# Bluetooth configuration
export BT_PLATFORM="connac1x"
