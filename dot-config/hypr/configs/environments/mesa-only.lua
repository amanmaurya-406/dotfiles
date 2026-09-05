-- -----------------------------------------------------
-- Environment Variables
-- name: "Mesa-only"
-- -----------------------------------------------------

-- Source default environments
require("configs/environments/defaults")

-- hl.env("WLR_DRM_DEVICES","/dev/dri/card1")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")
hl.env("LIBVA_DRIVER_NAME", "iHD")
