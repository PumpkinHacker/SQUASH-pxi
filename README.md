# SQUASH PXI

A mobile-friendly 2D pixel-art Sasquatch forest adventure prototype.

## Play locally
Open `index.html` in a modern browser. Movement uses WASD / arrow keys, touch D-pad, or tapping the map. Interact with the Hollow Log, Honey Bear, Sasquatch Lake, Secret Cave, and Chortles Shop. Local progress uses browser localStorage on that device.

## Admin preview
Open `admin/index.html`. This is a UI scaffold only. It intentionally does not authenticate anyone or make real account/economy changes until a server backend is connected.

## Production backend still required
- Cloudflare Worker API with server-side authorization and protected admin routes.
- Durable account store (Cloudflare D1) and migrations.
- Secure password hashing / managed authentication, MFA, session cookies, rate limiting, and recovery.
- Heartbeat-based live presence with expiry.
- Region totals using voluntary country selection or privacy-preserving country-level analytics; no raw IP display.
- Coin adjustments with reason, actor, timestamp, and audit history.
- Admin role bootstrap through Cloudflare secrets / Access policy, never a password hard-coded in frontend files.

Never store or display plain-text passwords. GitHub Pages can host the static game and admin shell, but it cannot itself securely process logins or persist shared live game state.

## Deploy
Enable GitHub Pages for this repository using **Settings → Pages → Deploy from a branch → main → /(root)**. The game URL will be `https://pumpkinhacker.github.io/SQUASH-pxi/` after Pages finishes deploying. The admin preview is at `/admin/`.

The URL is a prediction based on GitHub Pages naming; verify it in repository Settings → Pages after enabling deployment.
