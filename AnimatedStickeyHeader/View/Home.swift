//
//  Home.swift
//  AnimatedStickeyHeader
//
//  Created by Mahmudur Rahman on 13/12/22.
//

import SwiftUI

struct Home: View {
    //MARK: View Properties
    var safeArea: EdgeInsets
    var size: CGSize
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                //MARK: Artwork
                ArtWork()
                GeometryReader{ proxy in
                    Button {
                        
                    } label: {
                        Text("SHUFFLE PLAY")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 45)
                            .padding(.vertical, 12)
                            .background{
                                Capsule()
                                    .fill(Color("Green").gradient)
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(height: 50)
                .padding(.top, -34)
                
                VStack{
                    Text("Popular")
                        .fontWeight(.heavy)
                    
                    //MARK: Album View
                    AlbumView()
                }
                .padding(.top, 10)
            }
            .overlay(alignment: .top){
                HeaderView()
            }
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    @ViewBuilder
    func ArtWork()->some View{
        let height = size.height * 0.45
        GeometryReader{proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * 0.8)
            Image("Artwork")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay(content: {
                    ZStack(alignment: .bottom) {
                        //MARK: Gradient Overlay
                        Rectangle()
                            .fill(.linearGradient(colors: [
                                .black.opacity(0 - progress),
                                .black.opacity(0.1 - progress),
                                .black.opacity(0.3 - progress),
                                .black.opacity(0.5 - progress),
                                .black.opacity(0.7 - progress),
                                .black.opacity(0.9 - progress),
                                .black.opacity(1)
                            ], startPoint: .top, endPoint: .bottom))
                        VStack(spacing: 0){
                            Text("Jan\nBlomqvist")
                                .font(.system(size: 45))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                            Text("509,082 Monthly Listeners".uppercased())
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.top, 15)
                        }
                    }
                })
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
    }
    
    @ViewBuilder
    func AlbumView()->some View{
        VStack(spacing: 25) {
            ForEach(albums.indices, id: \.self){index in
                HStack(spacing: 25) {
                    Text("\(index + 1)")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(albums[index].albumName)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text("2,282,928")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(15)
    }
    
    @ViewBuilder
    func HeaderView()->some View{
        GeometryReader{proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Text("FOLLOWING")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .border(.white, width: 1)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal, .bottom], 15)
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}