# project
name := basm

# folders
bin_folder := bin
src_folder := src

# files
s_files := $(shell find $(src_folder) -name '*.s')
o_files := $(patsubst $(src_folder)/%.s, $(bin_folder)/%.o, $(s_files))

# assembler
as := as
as_flags := --64 \
			--fatal-warnings \
			-I$(src_folder)

# linker
entry := main
ld := ld
ld_flags := -e $(entry) \
			-nostdlib \
			--strip-all

# link all .o files into single executable
$(bin_folder)/$(name): $(o_files)
	@$(ld) $(ld_flags) $^ -o $@
	@echo '   ==> File Generated: $@'

# generate .o files from each .s file
$(bin_folder)/%.o: $(src_folder)/%.s | $(bin_folder)
	@mkdir -p $(dir $@)
	@$(as) $(as_flags) $< -o $@
	@echo '   ==> File Generated: $@'

# create binaries folder
$(bin_folder):
	@mkdir -p $@
	@echo '   ==> Folder Created: $@'

# destroy binaries folder
clean:
	@rm -rf $(bin_folder)
	@echo '   ==> Folder Destroyed: $(bin_folder)'
