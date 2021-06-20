FactoryBot.define do
  factory :record do
    title { "Test Cup" }
    place { "Osaka" }
    teamname { "TeamOsaka" }
    name_a { "Osaka Taro" }
    name_b { "Osaka Jiro" }
    name_c { "Osaka Saburo" }
    enemyteam { "TeamKyoto" }
    enemyname_a { "Kyoto Taro" }
    enemyname_b { "Kyoto Jiro" }
    enemyname_c { "Kyoto Saburo" }
    score_1 { 1 }
    score_2 { 2 }
    score_3 { 3 }
    score_4 { 4 }
    score_5 { 5 }
    score_6 { 6 }
    score_7 { 7 }
    score_8 { 8 }
    score_9 { 9 }
    score_10 { 5 }
    enemyscore_1 { 10 }
    enemyscore_2 { 10 }
    enemyscore_3 { 10 }
    enemyscore_4 { 10 }
    enemyscore_5 { 11 }
    enemyscore_6 { 5 }
    enemyscore_7 { 5 }
    enemyscore_8 { 5 }
    enemyscore_9 { 5 }
    enemyscore_10 { 5 }
    association :user
  end
end
