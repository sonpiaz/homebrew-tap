#!/bin/bash
# Usage: ./scripts/update-cask.sh kapt 1.0.0
# Updates the cask file with new version and sha256 from GitHub Release

set -e

CASK_NAME="$1"
VERSION="$2"

if [ -z "$CASK_NAME" ] || [ -z "$VERSION" ]; then
  echo "Usage: $0 <cask-name> <version>"
  echo "Example: $0 kapt 1.0.0"
  exit 1
fi

REPO="sonpiaz/${CASK_NAME}"
CASK_FILE="Casks/${CASK_NAME}.rb"
APP_NAME=$(echo "$CASK_NAME" | sed 's/.*/\u&/')  # Capitalize first letter

if [ ! -f "$CASK_FILE" ]; then
  echo "Error: $CASK_FILE not found"
  exit 1
fi

ZIP_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${APP_NAME}-${VERSION}.zip"

echo "Downloading ${ZIP_URL}..."
SHA256=$(curl -sL "$ZIP_URL" | shasum -a 256 | cut -d' ' -f1)

if [ -z "$SHA256" ] || [ "$SHA256" = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" ]; then
  echo "Error: Failed to download or empty file"
  exit 1
fi

echo "SHA256: $SHA256"

# Update version
sed -i '' "s/version \".*\"/version \"${VERSION}\"/" "$CASK_FILE"
# Update sha256
sed -i '' "s/sha256 \".*\"/sha256 \"${SHA256}\"/" "$CASK_FILE"

echo "Updated $CASK_FILE:"
head -3 "$CASK_FILE"
echo ""
echo "Done! Now commit and push:"
echo "  git add $CASK_FILE && git commit -m '${CASK_NAME}: ${VERSION}' && git push"
