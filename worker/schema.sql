PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS players (
  id TEXT PRIMARY KEY,
  username TEXT NOT NULL UNIQUE,
  region_code TEXT,
  coins INTEGER NOT NULL DEFAULT 0 CHECK (coins >= 0),
  created_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now')),
  last_seen TEXT,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','suspended'))
);

CREATE TABLE IF NOT EXISTS presence (
  player_id TEXT PRIMARY KEY REFERENCES players(id) ON DELETE CASCADE,
  last_heartbeat TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS coin_audit (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  player_id TEXT NOT NULL REFERENCES players(id),
  delta INTEGER NOT NULL,
  reason TEXT NOT NULL,
  admin_email TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
);

CREATE TABLE IF NOT EXISTS region_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  region_code TEXT NOT NULL,
  event_day TEXT NOT NULL DEFAULT (strftime('%Y-%m-%d','now'))
);
CREATE INDEX IF NOT EXISTS idx_players_region ON players(region_code);
CREATE INDEX IF NOT EXISTS idx_coin_audit_player ON coin_audit(player_id, created_at);
CREATE INDEX IF NOT EXISTS idx_presence_heartbeat ON presence(last_heartbeat);
