-- =====================================================
-- Astra AI Database Schema
-- =====================================================

-- USERS TABLE
CREATE TABLE Users (
user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
full_name VARCHAR(100) NOT NULL,
email VARCHAR(150) UNIQUE NOT NULL,
password_hash TEXT NOT NULL,
role VARCHAR(20) DEFAULT 'student',
profile_picture TEXT,
career_interest VARCHAR(100),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- GOALS TABLE
CREATE TABLE Goals (
goal_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
user_id UUID REFERENCES Users(user_id) ON DELETE CASCADE,
goal_title VARCHAR(200) NOT NULL,
goal_description TEXT,
target_date DATE,
status VARCHAR(20) DEFAULT 'Pending',
progress_percentage INT DEFAULT 0,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ACHIEVEMENTS TABLE
CREATE TABLE Achievements (
achievement_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
user_id UUID REFERENCES Users(user_id) ON DELETE CASCADE,
badge_name VARCHAR(100) NOT NULL,
badge_description TEXT,
badge_level VARCHAR(50),
earned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PROGRESS TRACKING TABLE
CREATE TABLE Progress (
progress_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
user_id UUID REFERENCES Users(user_id) ON DELETE CASCADE,
category VARCHAR(100),
score INT,
remarks TEXT,
recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CHAT HISTORY TABLE
CREATE TABLE ChatHistory (
chat_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
user_id UUID REFERENCES Users(user_id) ON DELETE CASCADE,
user_message TEXT NOT NULL,
ai_response TEXT NOT NULL,
conversation_type VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- SAMPLE ACHIEVEMENT LEVELS
-- =====================================================
--------------------------------------------------------

-- Beginner Explorer
-- Skill Builder
-- Consistent Learner
-- Interview Ready
-- Industry Ready
-- Astra Champion
-----------------

-- =====================================================
-- SAMPLE PROGRESS CATEGORIES
-- =====================================================
--------------------------------------------------------

-- Resume Score
-- Interview Performance
-- Learning Progress
-- Goal Completion
-- Skill Development
--------------------

-- =====================================================
