import UIKit
import PlaygroundSupport

public class DisplayViewController: UIViewController {

    var display: Display!
    
    override public func viewDidLoad() {
        display = Display(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 80, height: (self.view.frame.width - 80) * 2/3))
        display.center = self.view.center
        self.view.addSubview(display)
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLoad()
        
        display.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 100, height: self.view.frame.width - 100 * 2 / 3)
        display.center = self.view.center
    }
    
}

extension DisplayViewController: PlaygroundLiveViewMessageHandler {
    
    public func liveViewMessageConnectionOpened() {
        // We don't need to do anything in particular when the connection opens.
    }
    
    public func liveViewMessageConnectionClosed() {
        // We don't need to do anything in particular when the connection closes.
    }
    
    public func receive(_ message: PlaygroundValue) {
        
        /*switch message {
        case let .string(text):
            // A text value all by itself is just part of the conversation.
            processConversationLine(text)
        case let .integer(number):
            reply("You sent me the number \(number)!")
        case let .boolean(boolean):
            reply("You sent me the value \(boolean)!")
        case let .floatingPoint(number):
            reply("You sent me the number \(number)!")
        case let .date(date):
            reply("You sent me the date \(date)")
        case .data:
            reply("Hmm. I don't know what to do with data values.")
        case .array:
            reply("Hmm. I don't know what to do with an array.")
        case let .dictionary(dictionary):
            guard case let .string(command)? = dictionary["Command"] else {
                // We received a dictionary without a "Command" key.
                reply("Hmm. I was sent a dictionary, but it was missing a \"Command\".")
                return
            }
            
            switch command {
            case "Echo":
                if case let .string(message)? = dictionary["Message"] {
                    reply(message, bounce: true)
                }
                else {
                    // We didn't have a message string in the dictionary.
                    reply("Hmm. I was told to \"Echo\" but there was no \"Message\".")
                }
            case "AddJoke":
                if let patternValue = dictionary["Pattern"] {
                    do {
                        let pattern = try JokePattern(playgroundValue: patternValue)
                        addJokePattern(pattern)
                    }
                    catch let error as JokePattern.SerializationError {
                        // If we cannot decode the pattern then someone may have been
                        // experimenting and poking into the key value store.
                        let errorMessage: String
                        switch error {
                        case .valueNotADictionary:
                            errorMessage = "The value of \"Pattern\" was not a dictionary."
                        case .missingSetupString:
                            errorMessage = "Missing the setup string."
                        case .missingPunchlineString:
                            errorMessage = "Missing the punchline string."
                        case .missingResponseString:
                            errorMessage = "Missing the response string."
                        case .missingFaceString:
                            errorMessage = "Missing the face string."
                        case .unknownFaceString(let faceString):
                            errorMessage = "Unknown face string \"\(faceString)\"."
                        }
                        reply("Hmm. I don't know how to interpret the joke pattern you sent. \(errorMessage)")
                    }
                    catch {
                        reply("Hmm. Something went wrong trying to interpret the joke pattern you sent. \(String(reflecting: error))")
                    }
                }
                else {
                    // We didn't have a pattern key, there's nothing to do!
                    reply("Hmm. I was told to \"AddJoke\" but there was no \"Pattern\" to add.")
                }
            default:
                // We received a command we didn't recognize. Let's mention that.
                reply("Hmm. I don't recognize the command \"\(command)\".")
            }
        }*/
    }
}
