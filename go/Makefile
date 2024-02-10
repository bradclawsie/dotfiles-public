GO = go

# install/update some useful tools in local env
.PHONY: tools
tools:
	$(GO) install golang.org/x/tools/cmd/goimports@latest
	$(GO) install mvdan.cc/gofumpt@latest
	$(GO) install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	$(GO) install honnef.co/go/tools/cmd/staticcheck@latest
	$(GO) install golang.org/x/vuln/cmd/govulncheck@latest
	$(GO) install golang.org/x/tools/gopls@latest

