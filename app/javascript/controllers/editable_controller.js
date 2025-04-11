import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editable"
export default class extends Controller {
  static targets = ['title']
  
  connect() {
  }
  
  update_title(e) {
    e.preventDefault()
    this.token = document.querySelector('meta[name="csrf-token"]').content
    const pathname = window.location.pathname.split('/')
    const notebook_id = pathname[2]
    const page_id = pathname[4]
    console.log(this.token)
    
    fetch(`/notebooks/${notebook_id}/pages/${page_id}`, {
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
    .then(page => this.titleTarget.innerHTML = JSON.parse(page).title);
    document.querySelector("#body").focus()
  }
}
