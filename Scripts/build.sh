#build script
#!/usr/bin/env bash
set -euo pipefail

# ---- CONFIG ----
SCHEME="PublicRepo"                 # <-- replace with your framework target/scheme name
FRAMEWORK_NAME="DesignTokens"         # <-- framework name (without extension)
OUTPUT_DIR="$(pwd)/build"      # where artifacts will be stored
XCFRAMEWORK_NAME="${FRAMEWORK_NAME}.xcframework"
ZIP_NAME="${FRAMEWORK_NAME}.xcframework.zip"
# -----------------

# Clean
rm -rf "${OUTPUT_DIR}"
mkdir -p "${OUTPUT_DIR}"

# 1) Archive for device (iOS)
echo "Archiving iOS device build..."
xcodebuild archive \
  -scheme "${SCHEME}" \
  -configuration Release \
  -destination "generic/platform=iOS" \
  -archivePath "${OUTPUT_DIR}/ios_devices.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  BUILD_ACTIVE_ARCH_ONLY=NO

# 2) Archive for simulator (iphonesimulator)
echo "Archiving iOS simulator build..."
xcodebuild archive \
  -scheme "${SCHEME}" \
  -configuration Release \
  -sdk iphonesimulator \
  -archivePath "${OUTPUT_DIR}/ios_simulator.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  BUILD_ACTIVE_ARCH_ONLY=NO

# 3) Create XCFramework
echo "Creating ${XCFRAMEWORK_NAME}..."
xcodebuild -create-xcframework \
  -framework "${OUTPUT_DIR}/ios_devices.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
  -framework "${OUTPUT_DIR}/ios_simulator.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
  -output "${OUTPUT_DIR}/${XCFRAMEWORK_NAME}"

# 4) Zip it (for hosting)
echo "Zipping..."
pushd "${OUTPUT_DIR}" > /dev/null
rm -f "${ZIP_NAME}"
zip -r "${ZIP_NAME}" "${XCFRAMEWORK_NAME}"
popd > /dev/null

# 5) Compute SPM checksum (requires `swift` tool)
echo "Computing checksum..."
ZIP_PATH="${OUTPUT_DIR}/${ZIP_NAME}"
CHECKSUM=$(swift package compute-checksum "${ZIP_PATH}")
echo "XCFramework zip: ${ZIP_PATH}"
echo "SPM checksum: ${CHECKSUM}"

# Done
echo "Build finished. Artifacts in ${OUTPUT_DIR}"
echo "Upload ${ZIP_PATH} to hosting (e.g. GitHub Releases) and use the checksum in Package.swift."
