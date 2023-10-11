#!/usr/bin/R Rscript

  # Install the "ggplot2" R package if not already installed 
  #install.package("ggplot2")
library(ggplot2)

inputDelimPath = "C:/Users/paul_/OneDrive - DPIE/General_and_Overall/Journal_papers/Bee_Brood_Diseases/AFB/Sept_2023_Draft/Panaroo_Pan_Genome/scoary/scoary_scripts/COG_Scripts/classifier_result.tsv"
inputDir = dirname(inputDelimPath)
inputBaseName = basename(inputDelimPath)
outputName = gsub(".tsv", "_out.csv", inputBaseName)
outputPath = paste0(inputDir, "/", outputName)
inputCOGtable = read.delim(inputDelimPath)
COG_Categories = table(inputCOGtable$COG_DESCRIPTION, useNA = 'always')
COG_Categories_Measure = data.frame(COG_Description = names(COG_Categories), Number = as.vector(COG_Categories))
COG_Categories_Measure = na.omit(COG_Categories_Measure)
totalNum = sum(COG_Categories_Measure$Number)
COG_Categories_Measure$percent = round(COG_Categories_Measure$Number/sum(COG_Categories_Measure$Number)*100, digits = 2)
COG_Categories_Measure = COG_Categories_Measure[order(COG_Categories_Measure$percent, decreasing = TRUE), ]
row.names(COG_Categories_Measure) <- NULL

write.csv(x = COG_Categories_Measure, file = outputPath, row.names = FALSE)

colours23 = c(
  "#8a6eb1", "#8733fa", "#4421af", "#1a53ff",
  "#0d88e6", "#00b7c7", "#5ad45a", "#8be04e",
  "#bef045", "#f0ea45", "#f0ea45", "#ead44d",
  "#e2bf51", "#daab54", "#d29655", "#c98155",
  "#bf6d53", "#b5584f", "#aa424a", "#9f2943",
  "#93003a", "#70012d", "#31101a"
)

# Load ggplot2
library(ggplot2)

# lock in factor level order
COG_Categories_Measure$COG_Description = factor(COG_Categories_Measure$COG_Description, levels = COG_Categories_Measure$COG_Description)

# >>>> Save piechart as PDF <<<<<
pdfPath = paste0(inputDir, "/classifier_result_pie.pdf")
pdf(file = pdfPath, # The directory you want to save the file in
    width = 11.7, # The width of the plot in inches
    height = 8.3) # The height of the plot in inches
# Basic piechart
ggplot(COG_Categories_Measure, aes(x="", y=percent, fill=COG_Description)) +
  geom_bar(stat="identity", width=1, color = "white") +
 scale_fill_manual(values = colours23) +
  coord_polar("y", start=0) +
  theme(legend.title = element_text(size=30)) +
  theme_void() + # remove background, grid, numeric label
  labs(fill="COG Categories")
dev.off()
# >>>> END save <<<<<

# >>>> Save barchart as PDF <<<<<
pdfPath = paste0(inputDir, "/classifier_result_bar.pdf")
pdf(file = pdfPath, # The directory you want to save the file in
    width = 11.7, # The width of the plot in inches
    height = 8.3) # The height of the plot in inches
# Barchart
ggplot(COG_Categories_Measure, aes(x=COG_Description, y=percent, fill=COG_Description)) + 
  geom_bar(stat="identity") +
  geom_text(aes(label=percent), vjust=1.5, colour="white", size=3.5) +
  scale_fill_manual(values = colours23) +
  xlab("COG Category") + ylab("Percent") +
  theme(legend.position="none") +
  theme(axis.text.x = element_text(angle = 75,  hjust=1))
dev.off()
# >>>> END save <<<<<
