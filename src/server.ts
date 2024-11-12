import express, {Request, NextFunction, Response } from "express";
import 'express-async-errors';
import { router } from "./routes";
import cors from 'cors';
import path from 'path';

const app=express();

app.use(express.json());

app.use(cors());
app.use(router);
//costumizamos caminho estático para pegar as imagens
app.use(
  ['/files', '/tmp'],
  express.static(path.resolve(__dirname, '..', 'tmp'))
);

app.use((err: Error, req: Request, res: Response, next: NextFunction)=>{

  if(err instanceof Error){
    return res.status(400).json({
      error:err.message
    })
  }
  return res.status(500).json({
    status:'Error',
    message:'Internal Error.'
  })
})
app.listen(3333,()=> console.log("servidor online na porta 3333")); 