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
