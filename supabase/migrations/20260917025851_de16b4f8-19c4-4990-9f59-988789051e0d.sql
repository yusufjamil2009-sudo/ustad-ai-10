INSERT INTO public.ustad_shop_items (item_id, name, category, price_coins, description, asset_reference, status, availability, ownership_type, sort_order) VALUES
('frame_bronze','Bronze Ring','avatar_frames',1500,'A warm bronze ring around your avatar.','frame/bronze','active','permanent','permanent',10),
('frame_silver','Silver Ring','avatar_frames',4000,'A clean silver ring around your avatar.','frame/silver','active','permanent','permanent',20),
('frame_gold','Gold Ring','avatar_frames',9000,'A bright gold ring around your avatar.','frame/gold','active','permanent','permanent',30),
('frame_neon','Neon Pulse','avatar_frames',15000,'A glowing neon ring around your avatar.','frame/neon','active','permanent','permanent',40),
('frame_royal','Royal Crest','avatar_frames',25000,'A regal crest frame for your avatar.','frame/royal','active','permanent','permanent',50),

('pframe_slate','Slate Border','profile_frames',2000,'A soft slate border for your profile card.','profile-frame/slate','active','permanent','permanent',10),
('pframe_aurora','Aurora Border','profile_frames',7000,'A cool aurora gradient border.','profile-frame/aurora','active','permanent','permanent',20),
('pframe_emberline','Emberline Border','profile_frames',12000,'A warm ember line around your card.','profile-frame/emberline','active','permanent','permanent',30),

('ptheme_midnight','Midnight','profile_themes',3000,'A deep midnight background for your profile.','profile-theme/midnight','active','permanent','permanent',10),
('ptheme_sunrise','Sunrise','profile_themes',5000,'A soft sunrise gradient background.','profile-theme/sunrise','active','permanent','permanent',20),
('ptheme_forest','Forest','profile_themes',5000,'A calm green forest background.','profile-theme/forest','active','permanent','permanent',30),
('ptheme_cosmos','Cosmos','profile_themes',11000,'A starry cosmos background.','profile-theme/cosmos','active','permanent','permanent',40),

('name_classic','Classic Name','name_styles',2500,'A timeless serif treatment for your name.','name/classic','active','permanent','permanent',10),
('name_premium','Premium Name','name_styles',6000,'A bold italic treatment for your name.','name/premium','active','permanent','permanent',20),
('name_gold','Gold Name','name_styles',14000,'A shimmering gold gradient name.','name/gold','active','permanent','permanent',30),
('name_diamond','Diamond Name','name_styles',22000,'A cool diamond gradient name.','name/diamond','active','permanent','permanent',40),

('badge_star','Learning Star','badges',1200,'A star emblem shown next to your name.','badge/star','active','permanent','permanent',10),
('badge_quiz','Quiz Master','badges',3500,'A target emblem for quiz lovers.','badge/quiz','active','permanent','permanent',20),
('badge_knowledge','Knowledge Pro','badges',5500,'A books emblem for steady learners.','badge/knowledge','active','permanent','permanent',30),
('badge_top','Top Learner','badges',9000,'A trophy-styled decorative emblem.','badge/top','active','permanent','permanent',40),
('badge_champion','Champion','badges',16000,'A crown emblem for your name.','badge/champion','active','permanent','permanent',50),
('badge_legend','Legend','badges',30000,'A glowing star emblem for your name.','badge/legend','active','permanent','permanent',60),

('ctheme_chalk','Chalk Classroom','classroom_themes',4000,'A classic chalkboard look for the Classroom.','classroom-theme/chalk','active','permanent','permanent',10),
('ctheme_glass','Glass Classroom','classroom_themes',8000,'A modern glass look for the Classroom.','classroom-theme/glass','active','permanent','permanent',20),
('ctheme_night','Night Classroom','classroom_themes',8000,'A low-light Classroom presentation look.','classroom-theme/night','active','permanent','permanent',30),

('btheme_white','White Board','board_themes',2500,'A crisp white board surface.','board-theme/white','active','permanent','permanent',10),
('btheme_green','Green Board','board_themes',2500,'A traditional green board surface.','board-theme/green','active','permanent','permanent',20),
('btheme_ink','Ink Board','board_themes',6500,'A dark ink board surface.','board-theme/ink','active','permanent','permanent',30),

('ttheme_calm','Calm Teacher','teacher_themes',5000,'A calm presentation style. Visuals only.','teacher-theme/calm','active','permanent','permanent',10),
('ttheme_energetic','Energetic Teacher','teacher_themes',7000,'A lively presentation style. Visuals only.','teacher-theme/energetic','active','permanent','permanent',20),
('ttheme_scholar','Scholar Teacher','teacher_themes',9000,'A scholarly presentation style. Visuals only.','teacher-theme/scholar','active','permanent','permanent',30),

('tcos_confetti','Victory Confetti','tournament_cosmetics',6000,'Decorative confetti on your result screen.','tournament/confetti','active','permanent','permanent',10),
('tcos_spotlight','Arena Spotlight','tournament_cosmetics',10000,'A decorative spotlight on the arena board.','tournament/spotlight','active','permanent','permanent',20),
('tcos_aura','Player Aura','tournament_cosmetics',18000,'A decorative aura beside your player row.','tournament/aura','active','permanent','permanent',30),

('unlock_profile_colors','Profile Colour Picker','feature_unlocks',7000,'Unlock custom colours for your profile card.','unlock/profile-colors','active','permanent','permanent',10),
('unlock_extra_slots','Extra Cosmetic Slots','feature_unlocks',12000,'Unlock extra saved cosmetic presets.','unlock/extra-slots','active','permanent','permanent',20),
('unlock_animated_avatar','Animated Avatar Ring','feature_unlocks',20000,'Unlock a gently animated avatar ring.','unlock/animated-avatar','active','permanent','permanent',30)
ON CONFLICT (item_id) DO NOTHING;