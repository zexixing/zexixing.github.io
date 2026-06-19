# Zexi Xing Website

This repository publishes <https://zexixing.github.io/> from the repository root.

The maintainable Hugo source lives in `src/`. Generated files are written to the repository root so GitHub Pages can continue publishing from `master` without changing repository settings.

## Build

```bash
./scripts/build_site.sh
```

The build script expects `hugo` on `PATH`. It removes the previous generated site files, builds the source in `src/`, and copies the generated site back to the repository root.

Do not commit private application PDFs or other unpublished application materials.
