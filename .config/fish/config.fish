if status is-interactive
# Commands to run in interactive sessions can go here
end

PCI_IDS_PATH=$(nix-build --no-link -A pciutils)/share/hwdata/pci.ids macchina
