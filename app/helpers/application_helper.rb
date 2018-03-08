module ApplicationHelper
  def login_helper style = '', tag_type, tag_type_class
    if current_user.is_a?(GuestUser)
      login_link = "<#{tag_type} class='#{tag_type_class}'><a href='/login' class='#{style}'>Login</a></#{tag_type} class='#{tag_type_class}'>"
      register_link = "<#{tag_type} class='#{tag_type_class}'><a href='/register' class='#{style}'>Register</a></#{tag_type} class='#{tag_type_class}'>"
      #(link_to "Register", new_user_registration_path, class: style) +
      # ".html_safe +
      #(link_to "Login", new_user_session_path, class: style)
      login_link.html_safe + register_link.html_safe
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    CWRUViewTool::Renderer.copyright 'Adrian Guzman', 'Dunder Mifflin Paper Company, Inc'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      }
    ]
  end

  def nav_helper style, tag_type, tag_type_class
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type} class='#{tag_type_class}'><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type} class='#{tag_type_class}'>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end
