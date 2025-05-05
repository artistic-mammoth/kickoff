#!/bin/bash

echo "🔧 Building Swift project in release mode..."
if swift build -c release; then
    echo "✅ Build completed successfully."
else
    echo "❌ Build failed. Check the errors above."
    exit 1
fi

echo "📦 Looking for built executable named 'kickoff' in .build/release..."

# Search specifically for an executable named 'kickoff'
executable=".build/release/kickoff"

if [ -f "$executable" ]; then
    echo "✅ Found executable: $executable"
else
    echo "❌ No executable named 'kickoff' found."
    exit 1
fi

output_dir="output"
mkdir -p "$output_dir"

output_path="$output_dir/$(basename "$executable")"

cp "$executable" "$output_path"

echo "🚚 Moved executable to '$output_path'."
echo "🎉 Done! Your release build is ready in the 'output' folder."
