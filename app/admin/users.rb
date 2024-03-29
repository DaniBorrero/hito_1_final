ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :image_url
  #
  # or
  #
  permit_params do
     permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :image_url]
     permitted << :other if params[:action] == 'create' && current_user.admin?
     permitted
  end

  index do
    id_column
    column :email    
    column :username
    column :followings do |f|
      f.followings.count
    end  
    #FALTA TERMINAR 
    # column :tweets do |tweet|
    #   tweet.tweets.count
    # end   
    actions
  end  
  
  index as: :grid do |product|
    link_to image_tag(product.image_path), admin_product_path(product)
  end
end
