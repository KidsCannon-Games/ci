deploy:
	@echo "apply itamae..."
	@itamae ssh -u core -h $(HOST) -y node.yml recipe.rb
	@echo "reboot now..."
	@ssh core@$(HOST) sudo reboot || true
