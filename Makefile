.PHONY: pull push

# Pull from remote
pull:
	git pull

# Push with timestamp and emoji
push:
	@echo "🔄 Preparing to push changes..."
ifndef m
	$(eval m := Update changes)
endif
	$(eval timestamp := $(shell date "+%Y-%m-%d %H:%M"))
	git add .
	git commit -m "📦 $(m) — $(timestamp)"
	git push origin main
	@echo "✅ Pushed with message: 📦 $(m) — $(timestamp)"

# 🌐 Open GitHub wiki in browser (auto-detect repo)
open-wiki:
	$(eval repo_url := $(shell git config --get remote.origin.url))
	$(eval clean_url := $(shell echo $(repo_url) | sed 's#git@github.com:#https://github.com/#; s#\.git$$##; s#^https://github.com/#https://github.com/#'))
	@echo "🌐 Opening: $(clean_url)/wiki"
	open $(clean_url)/wiki