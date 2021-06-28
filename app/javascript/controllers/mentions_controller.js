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
      this.tribute.range.pasteHTML = this._pasteHtml.bind(this)
      this.fieldTarget.addEventListener("tribute-replaced",this.replaced)
    }

    replaced(e){
      const mention = e.detail.item.original

      // const attachment = new Trix.Attachment({
      //   sgid: mention.sgid,
      //   content: mention.content
      // })
     
      // this.editor.insertAttachment(attachment)
      this.editor.insertString("mention.email")
    }
    
    _pasteHtml(html, startPos, endPos) {
      const position = this.editor.getPosition()
      console.log(position)
      this.editor.setSelectedRange ([position  - (endPos - startPos), position]) 
      this.editor.deleteInDirection("backward")
    }

    async fetchUsers(text, callback) {
        const url = `/mentions.json?query=${text}`
        const response = await fetch(url);
        const users = await response.json();
        callback(users);
    }

     
}

