/**
 * 
 */
package parser;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;

/**
 * @author pridhvi
 *
 */
public class FileUploader extends JPanel implements ActionListener {

	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	JButton upload;
	 JFileChooser select;
	 String choosertitle;
	    
	  public FileUploader() {
	    upload = new JButton("Browse");
	    upload.addActionListener(this);
	    add(upload);
	   }
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		int result;
        
	    select = new JFileChooser();
	    select.setCurrentDirectory(new java.io.File("."));
	    select.setDialogTitle(choosertitle);
	    select.setFileSelectionMode(JFileChooser.FILES_ONLY);
	    
	    //
	    // disable the "All files" option.
	    //
	    select.setAcceptAllFileFilterUsed(false);
	    //   
	    if (select.showOpenDialog(this) == JFileChooser.APPROVE_OPTION) {
	      System.out.println("getCurrentDirectory(): "
	         +  select.getCurrentDirectory());
	      System.out.println("getSelectedFile() : "
	         +  select.getSelectedFile());
	      }
	    else {
	      System.out.println("No Selection ");
	      }
	    ReadCSV obj=new ReadCSV();
		obj.setFileName(select.getSelectedFile());
		obj.setColSpilter(",");
		//List<String[]> arr=obj.readCSV(obj.getFileName());
		//System.out.println(arr.size());
	}
	public Dimension getPreferredSize(){
	    return new Dimension(200, 200);
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JFrame frame = new JFrame("");
	   FileUploader panel = new FileUploader();
	    frame.addWindowListener(
	      new WindowAdapter() {
	        public void windowClosing(WindowEvent e) {
	          System.exit(0);
	          }
	        }
	      );
	    frame.getContentPane().add(panel,"Center");
	    frame.setSize(panel.getPreferredSize());
	    frame.setVisible(true);
	    }

	}



