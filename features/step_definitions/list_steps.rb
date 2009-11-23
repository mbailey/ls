Then /^I should see (\d+) "([^\"]*)"$/ do |count, type|
  response.should have_tag(".#{dehumanize(type).singularize.underscore}", count.to_i)
end

# Link name must be link content or title attribute
When /^I click the "([^\"]*)" link for this "([^\"]*)"$/ do |link, model|
  object = get_current_object_for(model)
  within("##{dom_id(object)}") do |scope|
    scope.click_link link
  end
end
