function sigList = sigParser(mdlName)
% Unfortunately, it is not quicker than find_system.

sigList = struct('Name',{}, 'PortNumber',{}, 'BlockSID',{});

zipFile = java.util.zip.ZipFile(which(mdlName));
entries = zipFile.entries;
entryName = 'simulink/blockdiagram.xml';

while true
    try
        zipEntry = entries.next;
        if strcmp(char(zipEntry.getName), entryName)
            inputStream = zipFile.getInputStream(zipEntry);
            break;
        end
    catch
        break;
    end
end

inputFactory = javax.xml.stream.XMLInputFactory.newInstance;
xmlStreamReader = inputFactory.createXMLStreamReader(inputStream);

START_ELEMENT = javax.xml.stream.XMLStreamConstants.START_ELEMENT;
END_ELEMENT = javax.xml.stream.XMLStreamConstants.END_ELEMENT;

blkJstr = java.lang.String('Block');
pJstr = java.lang.String('P');
portNumberJstr = java.lang.String('PortNumber');
portJstr = java.lang.String('Port');

while (xmlStreamReader.hasNext)
    event = xmlStreamReader.next;
    if event == START_ELEMENT
        localName = xmlStreamReader.getLocalName;
        if localName.equals(blkJstr)
            SID = xmlStreamReader.getAttributeValue(2);
        elseif localName.equals(portJstr)
            % Port founded, check details
            while xmlStreamReader.hasNext
                event = xmlStreamReader.next;
                if event == START_ELEMENT
                    localName = xmlStreamReader.getLocalName;
                    if localName.equals(pJstr)
                        attributeValue = xmlStreamReader.getAttributeValue(0);
                        if attributeValue.equals(portNumberJstr)
                            portNumberChar = xmlStreamReader.getElementText;
                        elseif strcmp(attributeValue, 'Name')
                            portName = xmlStreamReader.getElementText;
                            sigList(end+1).Name = char(portName);
                            sigList(end).PortNumber = str2double(portNumberChar);
                            sigList(end).BlockSID = char(SID);
                        end
                    end
                elseif event == END_ELEMENT
                    localName = xmlStreamReader.getLocalName;
                    if localName.equals(pJstr)
                        break
                    end
                end
            end
        end
    end
end

end