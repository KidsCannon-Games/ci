deploy:
	@echo "apply itamae..."
	@itamae ssh -u core -h $(HOST) -y node.yml recipe.rb
