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
        allowSpaces: false,
        lookup: 'username',
        values: this.fetchUsers,
      })
      this.tribute.attach(this.fieldTarget);
      this.tribute.range.pasteHtml = this._pasteHtml.bind(this)
      this.fieldTarget.addEventListener("tribute-replaced",this.replaced)
    }

    replaced(e){
      const mention = e.detail.item.original
      console.log(mention)
      // const attachment = new Trix.Attachment({
      //   sgid: mention.sgid,
      //   content: mention.content
      //  })
      const user_id = `${mention.id}`
      const string = `@${mention.username}`
      this.editor.insertHTML(`<a href="/users/${user_id}">${string}</a>`)
      this.editor.insertString(" ")
    }
    
    _pasteHtml(html, startPos, endPos) {
      let position = this.editor.getPosition()
      let tributeLength = endPos - startPos
      let trixStartPos = position - tributeLength
      let trixEndPos = position
      this.editor.setSelectedRange([trixStartPos, trixEndPos])
      this.editor.deleteInDirection("backward")
    }
    async fetchUsers(text, callback) {
      try {
        const url = `/api/v1/mentions?query=${text}`
        const response = await fetch(url);
        const users = await response.json();
        callback(users);
      }
      catch (error) {
        callback([]);
      }
       
    }

     
}

