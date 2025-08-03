-- 一時的にRLSを無効化（開発・テスト用）
-- 本番環境では適切なRLSポリシーを設定してください

ALTER TABLE exercises DISABLE ROW LEVEL SECURITY;
ALTER TABLE schedules DISABLE ROW LEVEL SECURITY;
ALTER TABLE exercise_records DISABLE ROW LEVEL SECURITY;