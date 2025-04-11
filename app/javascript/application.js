// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const happy_emoji = document.querySelector("#happy_emoji")
const emojis_cat_list = document.querySelector("#emojis_category_list")

happy_emoji.addEventListener('click', () => {
  emojis_cat_list.classList.toggle('closed')
})

document.addEventListener('keydown', (e) => {
  if (e.key == 'Escape') {
    if (!emojis_cat_list.classList.contains('closed'))
      emojis_cat_list.classList.toggle('closed')
  }
})