import { Controller } from "stimulus"
import Tribute from "tributejs"
import Trix from "trix"
export default class extends Controller {
  static targets = [ "field" ]

  connect() {
    this.editor = this.fieldTarget.editor
    this.initializeTribute()
  }

  disconnect() {
      this.tribute.detach(this.fieldTarget)
  }

  initializeTribute() {
      this.tribute = new Tribute ({
        allowSpaces: true,
        lookup: 'email',
        values: this.fetchUsers,
      })
      this.tribute.attach(this.fieldTarget);
    }

    async fetchUsers(text, callback) {
        const url = `/mentions.json?query=${text}`
        const response = await fetch(url);
        const users = await response.json();
        callback(users);
    }

     
}

