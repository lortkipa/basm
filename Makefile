# program
NAME := basm

# folders
BIN_DIR := bin
SRC_DIR := src

# files
SRC_FILES := $(shell find $(SRC_DIR) -name '*.s')
OBJ_FILES := $(patsubst $(SRC_DIR)/%.s,$(BIN_DIR)/%.o,$(SRC_FILES))

# assembly
ENTRY := main
ASSEMBLER := as
LINKER := ld

# compile every .o to executable
$(BIN_DIR)/$(NAME): $(OBJ_FILES)
	@$(LINKER) $^ -e $(ENTRY) -o $@
	@echo 'File Compiled: $@'

# compile each .s to .o
$(BIN_DIR)/%.o: $(SRC_DIR)/%.s | $(BIN_DIR)
	@mkdir -p $(dir $@)
	@$(ASSEMBLER) $< -o $@
	@echo 'File Compiled: $@'

# create binaries folder
$(BIN_DIR):
	@mkdir -p $@
	@echo 'Folder Created: $@'

# delete binaries folder
clean:
	@rm -rf $(BIN_DIR)
	@echo 'Folder Deleted: $(BIN_DIR)'