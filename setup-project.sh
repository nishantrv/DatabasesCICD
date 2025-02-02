#!/bin/bash

# Define the base directory (Current VS Code Project Folder)
BASE_DIR=$(pwd)

# Define the folder structure
FOLDERS=(
    "$BASE_DIR/Database"
    "$BASE_DIR/Database/Migrations"
    "$BASE_DIR/Database/Tests"
    "$BASE_DIR/SSIS"
    "$BASE_DIR/SSIS/Packages"
    "$BASE_DIR/Scripts"
    "$BASE_DIR/Scripts/Deploy"
    "$BASE_DIR/.github"
    "$BASE_DIR/.github/workflows"
)

# Define the files to be created
FILES=(
    "$BASE_DIR/Database/Migrations/0001_CreateOrdersTable.sql"
    "$BASE_DIR/Database/Tests/Test_CalculateDiscount.sql"
    "$BASE_DIR/.github/workflows/deploy-database.yml"
    "$BASE_DIR/.github/workflows/deploy-ssis.yml"
    "$BASE_DIR/Scripts/Deploy/Deploy-SSIS.sh"
)

# Create folders
for FOLDER in "${FOLDERS[@]}"; do
    if [ ! -d "$FOLDER" ]; then
        mkdir -p "$FOLDER"
        echo "Created Folder: $FOLDER"
    else
        echo "Folder Exists: $FOLDER"
    fi
done

# Create files
for FILE in "${FILES[@]}"; do
    if [ ! -f "$FILE" ]; then
        touch "$FILE"
        echo "Created File: $FILE"
    else
        echo "File Exists: $FILE"
    fi
done

echo "🎉 Project Setup Complete in VS Code!"
