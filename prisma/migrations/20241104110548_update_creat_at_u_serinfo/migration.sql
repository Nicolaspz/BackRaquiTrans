/*
  Warnings:

  - Added the required column `morada` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nif` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_name` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `users` ADD COLUMN `morada` VARCHAR(191) NOT NULL,
    ADD COLUMN `nif` VARCHAR(191) NOT NULL,
    ADD COLUMN `user_name` VARCHAR(191) NOT NULL;
