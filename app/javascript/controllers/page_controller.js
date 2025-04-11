import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="page"
export default class extends Controller {
  static targets = ["title", "emoji"]
  
  connect() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
    const pathname = window.location.pathname.split('/')
    this.notebook_id = pathname[2]
    this.page_id = pathname[4]
    this.emoji_api_url = 'https://emojihub.yurace.pro/api/random/category'
  }
  
  update_title(e) {
    e.preventDefault()
    
    fetch(`/notebooks/${this.notebook_id}/pages/${this.page_id}`, {
      method: 'PATCH',
      headers: {
        'X-CSFR-Token': this.token,
        'Content-Type': 'application/json'  
      },
      body: JSON.stringify({
        authenticity_token: this.token,
        page: {
          title: this.titleTarget.innerHTML
        }
      })
    }).then (resp => resp.text())
    .then(page => this.titleTarget.textContent = JSON.parse(page).title);
    document.querySelector("#body").focus()
  }

  async setEmoji() {
    const emoji_element = document.querySelector("#emoji_code")
    
    if (emoji_element.classList.length > 0) {
      console.log(emoji_element.className)
      const new_emoji = await this.fetchEmoji(emoji_element.className)
      emoji_element.innerHTML = new_emoji.htmlCode
    }
  }

  async saveCategory(e) {
    const emoji_span = document.querySelector("#emoji_code")
    const emoji_response = await this.fetchEmoji(e.target.textContent)

    console.log(emoji_span)

    fetch(`/notebooks/${this.notebook_id}/pages/${this.page_id}`, {
      method: 'PATCH',
      headers: {
        'X-CSFR-Token': this.token,
        'Content-Type': 'application/json'  
      },
      body: JSON.stringify({
        authenticity_token: this.token,
        page: {
          category: emoji_response.category
        }
      })
    }).then(emoji_span.innerHTML = emoji_response.htmlCode)
  }

  async fetchEmoji(category) {
    let emoji = await fetch(`${this.emoji_api_url}/${category}`)
      .then(response => response.text())
      .then(category => JSON.parse(category))
    return emoji
  }
}
