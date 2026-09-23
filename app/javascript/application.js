// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:before-cache", function () {
  document.querySelectorAll(".flash, .alert, .errors").forEach((el) => el.remove())
})