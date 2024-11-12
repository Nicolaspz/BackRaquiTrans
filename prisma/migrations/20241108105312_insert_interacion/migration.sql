/*
  Warnings:

  - You are about to alter the column `role` on the `users` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum(EnumId(3))`.
  - The values [SEMANAL,QUINZENAL,MENSAL] on the enum `users_tipo_pagamento` will be removed. If these variants are still used in the database, this will fail.
  - Added the required column `redes` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `users` ADD COLUMN `redes` VARCHAR(191) NOT NULL,
    MODIFY `role` ENUM('ADMIN', 'CLIENT') NOT NULL,
    MODIFY `tipo_pagamento` ENUM('CONTA_3DIAS', 'CONTA_7DIAS', 'CONTA_15DIAS', 'CONTA_30DIAS') NOT NULL;

-- CreateTable
CREATE TABLE `interacoes` (
    `id` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `autorId` VARCHAR(191) NOT NULL,
    `servicoId` VARCHAR(191) NOT NULL,
    `criado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `tipo` ENUM('RESPOSTA_ADMIN', 'COMENTARIO_USUARIO') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `interacoes` ADD CONSTRAINT `interacoes_autorId_fkey` FOREIGN KEY (`autorId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `interacoes` ADD CONSTRAINT `interacoes_servicoId_fkey` FOREIGN KEY (`servicoId`) REFERENCES `servicos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
