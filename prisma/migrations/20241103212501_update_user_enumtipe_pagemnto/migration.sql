/*
  Warnings:

  - You are about to alter the column `tipo_pagemento` on the `users` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum(EnumId(2))`.

*/
-- AlterTable
ALTER TABLE `users` MODIFY `tipo_pagemento` ENUM('SEMANAL', 'QUINZENAL', 'MENSAL') NOT NULL;
