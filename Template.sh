#!/usr/bin/env bash
# Use the shebang line to specify that this should be run using bash

# Determine the directory where this script is located and change to it
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Format the day number passed as an argument to a two-digit string (e.g., "01")
DAY=$(printf "%02d" "$1")

# Define the package name based on the day
PKG="adventOfCode2025.day${DAY}"

# Set up paths for source, test, and input directories
BASE_SRC="src/main/java/adventOfCode2025/day${DAY}"
BASE_TEST="src/test/java/adventOfCode2025/day${DAY}"
INPUTS="inputs"

# Create the directories if they don't exist
mkdir -p "$BASE_SRC" "$BASE_TEST" "$INPUTS"

# Overwrite protection
if [[ -f "$BASE_SRC/Day${DAY}.java" ]]; then
   # Prompt user to confirm overwrite
  read -p "Day ${DAY} already exists. Overwrite? (Y/N) " answer
  # Exit early if answer is not y
  [[ "$answer" != "Y" ]] && exit 1
fi

# Create DayXX.java in the source directory
cat > "$BASE_SRC/Day${DAY}.java" <<EOF
package $PKG;

import java.util.List;

public class Day${DAY} {

    public static long part1(List<String> input) {
        return 0;
    }

    public static long part2(List<String> input) {
        return 0;
    }
}
EOF

# Create DayXXTest.java in the test directory
cat > "$BASE_TEST/Day${DAY}Test.java" <<EOF
package $PKG;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class Day${DAY}Test {

    @Test
    void testSum() {
        int a = 5;
        int b = 3;
        int expected = 8;

        assertEquals(expected, add(a, b),
                "The sum of a and b should be equal to the expected value");
    }

    private int add(int a, int b) {
        return a + b;
    }
}
EOF

# Create an empty input file for DayXX
touch "$INPUTS/day${DAY}.txt"

# All good - let user know DayXX has been created successfully.
echo "Day ${DAY} created"
