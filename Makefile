release:
	npm run version
	@VERSION=$$(cat manifest.json | grep version | cut -d '"' -f 4 | head -n 1); \
	echo "Releasing version $$VERSION"; \
	git add .; \
	read -p "Commit content:" COMMIT; \
	echo "Committing '$$VERSION: $$COMMIT'"; \
	git commit -m "$$VERSION: $$COMMIT"; \
	git push origin main; \
	git tag v$$VERSION; \
	git push origin v$$VERSION
	echo "Done, check https://github.com/louis030195/obsidian-search/actions"

api:
	python3 api.py --port 3000 --model ./output/tsdae-model