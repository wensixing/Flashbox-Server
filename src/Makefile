OBJECTS=Categories.xsl Category.xsl FlashGame.xsl

all: clean validate-db $(OBJECTS) filelist
	@echo ==========================================
	@echo Done.

clean:
	@echo ==========================================
	@echo Clean Old Output...
	@rm -rf output/xml
	@mkdir output/xml

$(OBJECTS): %.xsl:
	@echo ==========================================
	@echo Process $@...
	@saxon -s:DB.xml -xsl:xsl/$@

filelist:
	@echo ==========================================
	@echo Generate Filelist xmls...
	@mkdir -p output/xml/Filelist
	@python script/build_file_list.py

validate-db:
	@echo ==========================================
	@echo Validate DB.xml...
	@xmllint DB.xml --schema xsd/Database.xsd --noout

validate-categories:
	@echo ==========================================
	@echo Validate categories.xml...
	@xmllint output/categories.xml --schema xsd/Categories.xsd --noout

