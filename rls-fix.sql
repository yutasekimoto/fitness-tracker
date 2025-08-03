-- 既存のRLSポリシーを削除
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

-- 匿名認証対応の新しいRLSポリシー
-- exercises テーブル
CREATE POLICY "Users can view own exercises" ON exercises
    FOR SELECT USING (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

CREATE POLICY "Users can insert own exercises" ON exercises
    FOR INSERT WITH CHECK (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

CREATE POLICY "Users can update own exercises" ON exercises
    FOR UPDATE USING (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

CREATE POLICY "Users can delete own exercises" ON exercises
    FOR DELETE USING (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

-- schedules テーブル
CREATE POLICY "Users can view own schedules" ON schedules
    FOR SELECT USING (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

CREATE POLICY "Users can insert own schedules" ON schedules
    FOR INSERT WITH CHECK (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

CREATE POLICY "Users can update own schedules" ON schedules
    FOR UPDATE USING (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

CREATE POLICY "Users can delete own schedules" ON schedules
    FOR DELETE USING (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

-- exercise_records テーブル
CREATE POLICY "Users can view own records" ON exercise_records
    FOR SELECT USING (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

CREATE POLICY "Users can insert own records" ON exercise_records
    FOR INSERT WITH CHECK (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

CREATE POLICY "Users can update own records" ON exercise_records
    FOR UPDATE USING (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );

CREATE POLICY "Users can delete own records" ON exercise_records
    FOR DELETE USING (
        user_id = COALESCE(auth.uid()::text, current_setting('request.jwt.claims', true)::json->>'sub')
        OR user_id = current_setting('app.current_user_id', true)
    );