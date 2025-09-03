#! /usr/bin/env Rscript


file <- commandArgs(trailing = TRUE)[1]

### Definición de la función.
format_table <- function (table) {
	even_numbers <- seq(0, 80, 2)
	n_cols <- ncol(table)
	table_x_indices <- seq(1, n_cols, 2)
	table_y_indices <- seq(2, n_cols, 2)
	zeroes <- vector()
	new_table <- data.frame(matrix(nrow = 41, ncol = n_cols / 2 + 1))
	for (i in seq(1, length(table_x_indices))) {
		zeroes[i] <- which(even_numbers == table[, table_x_indices[i]][1])
	}
	for (i in seq(1, length(table_y_indices))) {
		zeroes_table <- data.frame(matrix(0, nrow = zeroes[i]))
		table_column <- table[, table_y_indices[i], drop = FALSE]
		colnames(zeroes_table) <- colnames(table_column)
		new_column <- rbind(zeroes_table, table_column)
		new_column <- new_column[1:41, ]
		new_length <- nrow(new_column)
		new_column[is.na(new_column)] <- 0
		new_table[, i + 1] <- new_column
	}
	new_table <- new_table[1:41, ]
	new_table[, 1] <- even_numbers
	return(new_table)
}

# Leer la tabla llamada "test_matches.tsv", usando el tabulador como separador,
# y guardarla en el objeto table.
table <- read.table(file, sep = "\t")

# Aplicar la función format_table sobre table, guardar el resultado en el objeto
# formatted_table
formatted_table <- format_table(table)

# Guarda el objeto formatted_table en el archivo formatted_table.tsv usando
# tabuladores como separador
write.table(formatted_table, "formatted_table.tsv", sep = "\t", row.names = FALSE,
	col.names = FALSE)
