-- RLSポリシーを一時的に無効化（匿名認証問題の根本解決）
-- この操作はSupabaseのSQLエディターで実行してください

-- 1. 既存のRLSポリシーを削除
DROP POLICY IF EXISTS "Users can view own exercises" ON exercises;
DROP POLICY IF EXISTS "Users can insert own exercises" ON exercises;  
DROP POLICY IF EXISTS "Users can update own exercises" ON exercises;
DROP POLICY IF EXISTS "Users can delete own exercises" ON exercises;

DROP POLICY IF EXISTS "Users can view own schedules" ON schedules;
DROP POLICY IF EXISTS "Users can insert own schedules" ON schedules;
DROP POLICY IF EXISTS "Users can update own schedules" ON schedules;
DROP POLICY IF EXISTS "Users can delete own schedules" ON schedules;

DROP POLICY IF EXISTS "Users can view own records" ON exercise_records;
DROP POLICY IF EXISTS "Users can insert own records" ON exercise_records;
DROP POLICY IF EXISTS "Users can update own records" ON exercise_records;
DROP POLICY IF EXISTS "Users can delete own records" ON exercise_records;

-- 2. RLSを無効化（開発・テスト用）
ALTER TABLE exercises DISABLE ROW LEVEL SECURITY;
ALTER TABLE schedules DISABLE ROW LEVEL SECURITY;
ALTER TABLE exercise_records DISABLE ROW LEVEL SECURITY;

-- 注意: 本番環境では適切なRLSポリシーを設定してください
-- 現在は匿名認証とRLSの組み合わせで問題が発生しているため一時的に無効化