import java.io.*;
import java.math.BigDecimal;
import java.util.Calendar;
import java.lang.Integer;
import java.lang.String;

dataFile = 'invoicedata';
prices = [BigDecimal('19.99') BigDecimal('9.99') BigDecimal('15.99') BigDecimal('3.99') BigDecimal('4.99')];
unites = uint8([12 8 13 29 50]);
% unites = [Integer(12) Integer(8) Integer(13) Integer(29) Integer(50)];
% descs = [String('Java T-shirt') String('Java Mug') String('Duke Juggling Dolls') String('Java Pin') String('Java Key Chain')];
descs = {'Java T-shirt', 'Java Mug', 'Duke Juggling Dolls', 'Java Pin', 'Java Key Chain'};
out = ObjectOutputStream(BufferedOutputStream(FileOutputStream(dataFile)));

out.writeObject(Calendar.getInstance);
for i = 1:length(prices)
    out.writeObject(prices(i));
    out.writeInt(unites(i));
    out.writeUTF(descs{i});
end
out.close;

in = ObjectInputStream(BufferedInputStream(FileInputStream(dataFile)));
date = in.readObject;

disp(char(date.getTime));

try
    total = 0;
    while true
        price = in.readObject;
        unit = in.readInt; % This outputs 'double' for whatever you write in.
        desc = in.readUTF; % output java string
        disp(sprintf('You ordered %d units of %s at $%.2f%n', unit, desc, price));
        total = total + double(price) * unit;
    end
catch
end
disp(['For a TOTAL of: $' num2str(total)]);
in.close;