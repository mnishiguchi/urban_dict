# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = "", base_title = Rails.application.class.module_parent_name.titlecase)
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def flash_tag
    messages = []

    flash.each do |type, message|
      next if message.blank?

      level = case type
              when "notice" then "success"
              when "alert"  then "error"
              when "info"   then "info"
              when "warn"   then "warn"
              else
                "info"
              end

      js = %[iziToast.#{level}({ title: '#{level.capitalize}:', message: "#{message}" });]
      messages << javascript_tag(js)
    end

    messages.join("/n").html_safe
  end
end
