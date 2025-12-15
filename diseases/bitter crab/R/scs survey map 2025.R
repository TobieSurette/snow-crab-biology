
s <- read.scsset(2025, valid = 1)
s$week <- week(date(s))

cols <- rainbow(length(unique(s$week)))
names(cols) <- sort(unique(s$week))
pdf(file = "C:/Users/SuretteTJ/Desktop/github/snow-crab-biology/diseases/bitter crab/maps/Sample map 2025.pdf", width = 7, height = 5.75)
map.new()
map("coast", col = "papayawhip")
map("bathymetry")
points(lon(s), lat(s), pch = 21, cex = 0.65, 
       bg = fade(cols[as.character(s$week)], 0.75), col = "grey50", lwd = 0.5)
text(lon(s), lat(s), substr(s$tow.id, 3, 5), cex = 0.45, pos = 3, offset = 0.25)

tmp <- aggregate(date(s), by = s["week"], function(x) as.character(range(x)))
tmp[,2] <- substr(tmp[,2], 6, 15)
legend("bottomleft", 
       legend = apply(tmp[, 2], 1, paste, collapse = " to "), 
       pch = 21, col = "grey50", pt.lwd = 0.5, pt.bg = fade(cols),
       pt.cex = 1.25, cex = 0.75, box.col = "grey50", box.lwd = 0.5, bg = fade("white"))

box(col = "grey50", lwd = 0.5)

dev.off()
