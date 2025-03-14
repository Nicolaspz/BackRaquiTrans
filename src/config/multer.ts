import crypto from 'crypto'
import multer from 'multer'
import {extname, resolve} from 'path'

export default{
  upload(folder :string){
   return{
    storage:multer.diskStorage({
      destination:resolve(__dirname, '..', '..', folder),
      filename:(request, file, callback)=>{
        const fileHas= crypto.randomBytes(16).toString("hex");
        const filename= `${fileHas}-${file.originalname}`
        return callback(null, filename)
      
      }
    })
   }
  }
}