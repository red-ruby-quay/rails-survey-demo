survey = Survey.find_or_create_by!(title: "Quarterly service feedback") do |record|
  record.description = "Tell us how the internal reporting service is working for your team."
end

if survey.responses.empty?
  [
    ["Ayu", 5, "Fast and clear."],
    ["Bima", 4, "Useful dashboard, needs CSV export."],
    ["Citra", 3, "Sometimes slow at month end."]
  ].each do |name, score, comment|
    survey.responses.create!(respondent_name: name, score: score, comment: comment)
  end
end
