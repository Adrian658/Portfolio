module ApplicationHelper
  def login_helper style = '', tag_type, tag_type_class
    if current_user.is_a?(GuestUser)
      login_link = "<#{tag_type} class='#{tag_type_class}'><a href='/login' class='#{style}'>Login</a></#{tag_type} class='#{tag_type_class}'>"
      register_link = "<#{tag_type} class='#{tag_type_class}'><a href='/register' class='#{style}'>Register</a></#{tag_type} class='#{tag_type_class}'>"
      link = login_link + register_link
    else
      link = "<#{tag_type} class='#{tag_type_class}'><a href='/logout' class='#{style}' data-method='delete'>Logout</a></#{tag_type} class='#{tag_type_class}'>"
    end
    link.html_safe
  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}!"
      alert = "<div class='#{styles}' role='alert'>
        #{greeting}
        <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
          <span aria-hidden='true'>&times;</span>
        </button>
      </div>"
      alert.html_safe
    end
  end

  def copyright_generator
    CWRUViewTool::Renderer.copyright 'Adrian Guzman', 'Case Western Reserve University'
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
        url: tech_news_path,
        title: 'Twitter News'
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

  def nav_helper root, style, tag_type, tag_type_class
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type} class='#{tag_type_class}'><a href='#{item[:url]}' class='#{style} #{active? item, root}'>#{item[:title]}</a></#{tag_type} class='#{tag_type_class}'>"
    end

    nav_links.html_safe
  end

  def active? item, root
    "active" if (root == item[:title]) or current_page? item[:url]
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Adrian Guzman's Portfolio", sticky: false, time: 3000)
  end
end
