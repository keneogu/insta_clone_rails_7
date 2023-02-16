<%= turbo_stream.append :posts do %>
  <% @posts.each do |post| %>
    <% if user_signed_in? %>
      <% if current_user.following?(post.user) %>
        <%= render post %>
      <% end %>
    <% end %>
  <% end %>
  <% if !user_signed_in? %>
    <% @posts.each do |post| %>
      <%= render post%>
    <% end %>
  <% end %>
<% end %><% if @pagy.next.present? %>
  <%= turbo_stream.replace :pagination do %>
    <%= turbo_frame_tag :pagination, loading: :lazy,
                        src: posts_path(format: :turbo_stream, page: @pagy.next) %>
  <% end %>
<% end %>
