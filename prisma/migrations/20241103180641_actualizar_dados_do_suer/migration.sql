/*
  Warnings:

  - Added the required column `telefone` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipo_pagemento` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `users` ADD COLUMN `telefone` VARCHAR(191) NOT NULL,
    ADD COLUMN `tipo_pagemento` VARCHAR(191) NOT NULL;
